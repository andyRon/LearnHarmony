@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor('#65D')
          .onClick(() => {
            this.message = 'Hello ArkTS!'
          })
        Image('https://img12.360buyimg.com/n1/s450x450_jfs/t1/211556/35/38471/42993/64f1aa51F7ee8e4e5/5f8c4f9c149335ad.jpg')
          .width(250)  // vp 虚拟像素  默认数字自带

        Image($r('app.media.icon'))
          .width(250)
          .interpolation(ImageInterpolation.High)

      }
      .width('100%')
    }
    .height('100%')
  }
}