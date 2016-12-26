libge2d user guide
API:
int ge2d_open(void);
int ge2d_close(int fd);
int ge2d_process(int fd,aml_ge2d_info_t *pge2dinfo);


typedef struct aml_ge2d_info {
    unsigned int offset;
    unsigned int blend_mode;
    GE2DOP ge2d_op;
    buffer_info_t src_info[2];
    buffer_info_t dst_info;
    unsigned int color;
    unsigned int gl_alpha;
} aml_ge2d_info_t;
其数据结构含义如下：
unsigned int offset： 		osd的y_offset；
unsigned int blend_mode：	blend_mode 只对blend操作有效；
unsigned int color：        目前只对fillrectangle有效；
GE2DOP ge2d_op：            ge2d支持的操作
ge2d支持的操作：
    AML_GE2D_FILLRECTANGLE,
    AML_GE2D_BLEND,
    AML_GE2D_STRETCHBLIT,
    AML_GE2D_BLIT,

typedef struct buffer_info {
    unsigned int memtype;
    char* vaddr;
    unsigned long paddr;
    unsigned int canvas_w;
    unsigned int canvas_h;
    rectangle_t rect;
    int format;
    unsigned int rotation;
} buffer_info_t;
其数据结构含义如下：
memtype： 				如果由mem alloc,则设为:CANVAS_ALLOC
						如果使用osd,则设为：CANVAS_OSD0/CANVAS_OSD1
char* vaddr： 			不填，for debug
unsigned long paddr;	如果由mem alloc,则填写mem phy addr
						如果使用osd,则不设，kernel会自行获取；
unsigned int canvas_w;						
unsigned int canvas_h;  如果由mem alloc,则填写canvas width,height, related to mem size.
						如果使用osd,则不设，kernel会自行获取；
int format;				如果由mem alloc,则填写pixel format
						如果使用osd,则不设，kernel会自行获取；
rectangle_t rect;       根据实际情况填写rect，必须填；
unsigned int rotation;  可设为0/90/180/270；

1.  AML_GE2D_FILLRECTANGLE 需要设置的数据结构内容如下：
需要设置:
src_info[0]; 
dst_info;
color;
offset;

2.AML_GE2D_BLEND需要设置的数据结构内容如下：
需要设置:
src_info[0];
src_info[1];
dst_info;
blend_mode;
offset;
    
3.AML_GE2D_STRETCHBLIT 需要设置的数据结构内容如下：
需要设置:
src_info[0];
dst_info;
offset;

3.AML_GE2D_BLIT 需要设置的数据结构内容如下：
需要设置:
src_info[0];
dst_info;
offset;



