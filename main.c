

#include <stdio.h>
#include <stdlib.h>

#define SBM_HEADER_LEN  10
#define SBM_MAX_LEN  0x20000

FILE *in, *out;

unsigned char sbmhdr[SBM_HEADER_LEN];
unsigned char sbmdata[SBM_MAX_LEN];
int width, lines, height, size;

#define BMP_HEADER_LEN  62

unsigned char bmphdr[BMP_HEADER_LEN] =
{
    0x42, 0x4d, // type
    0x00, 0x00, 0x00, 0x00, // filesize
    0x00, 0x00, 0x00, 0x00, // always zero
    0x3e, 0x00, 0x00, 0x00, // offset to bitmap data
    0x28, 0x00, 0x00, 0x00, // 40
    0x00, 0x00, 0x00, 0x00, // bmp width
    0x00, 0x00, 0x00, 0x00, // bmp height
    0x01, 0x00, // planes
    0x08, 0x00, // bpp
    0x00, 0x00, 0x00, 0x00, // compression
    0xc0, 0xba, 0x02, 0x00, // image size
    0x00, 0x00, 0x00, 0x00, // x pix per meter
    0x00, 0x00, 0x00, 0x00, // y pix per meter
    0x02, 0x00, 0x00, 0x00, // colors in the bitmap
    0x02, 0x00, 0x00, 0x00, // "important" colors
    // palette
    0x00, 0x00, 0x00, 0x00, 
    0xff, 0xff, 0xff, 0x00, 
};

void outputline(int n)
{
    unsigned char *p;
    int i, x, v;

    for (i = 0; i < 8; i++) {
        p = sbmdata + (width * n);
        for (x = 0; x < width; x++) {
            v = *p & (1 << (i));
            fputc(v ? 0 : 1, out);
            p++;
        }
    }
}

void outputbmp(char *name)
{
    int i;

    size = BMP_HEADER_LEN + (width * height);

    bmphdr[2] = size & 0xff;
    bmphdr[3] = (size >> 8) & 0xff;
    bmphdr[4] = (size >> 16) & 0xff;
    bmphdr[5] = (size >> 24) & 0xff;

    bmphdr[18] = width & 0xff;
    bmphdr[19] = (width >> 8) & 0xff;

    bmphdr[22] = height & 0xff;
    bmphdr[23] = (height >> 8) & 0xff;

    out = fopen(name,"wb");
    if (out == NULL) {
        fprintf(stderr, "error: could not open output file.\n");
        exit(-1);
    }
    fwrite(bmphdr, BMP_HEADER_LEN, 1, out);
    for (i = 0; i < lines; i++) {
        outputline((lines - 1) - i);
    }
    fclose(out);
}

int main(int argc, char *argv[]) 
{

    in = fopen(argv[1],"rb");
    if (in == NULL) {
        fprintf(stderr, "error: could not open input file.\n");
        exit(-1);
    }
    fread(sbmhdr, SBM_HEADER_LEN, 1, in);
    width = sbmhdr[6] + (sbmhdr[7] << 8);
    lines = sbmhdr[8];
    height = lines * 8;
    printf("width: %d pixel\n", width);
    printf("height: %d lines (%d pixel)\n", lines, height);
    fread(sbmdata, SBM_MAX_LEN, 1, in);
    fclose(in);

    outputbmp(argv[2]);
}
