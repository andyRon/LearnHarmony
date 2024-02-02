@Entry
@Component
struct Index {
  @State imageWidth: number = 150

  build() {
    Column() {
      Row() {
        Image($r('app.media.icon'))
          .width(this.imageWidth)
          .interpolation(ImageInterpolation.High)
      }
      .width('100%')
      .height(400)
      .justifyContent(FlexAlign.Center)

      Row() {
        Text($r('app.string.width_label'))
          .fontSize(24)
          .fontWeight(FontWeight.Bold)

        TextInput({placeholder:'请输入图片宽度', text: this.imageWidth.toFixed(0)})
          .width(180)
          .backgroundColor('#fff')
          .type(InputType.Number)
          .onChange(value => {  // 箭头函数的参数只有一个时可以简写
            // console.log(value)
            this.imageWidth = parseInt(value)
          })
      }
      .width('100%')
      .padding({left: 14, right: 14})
      .justifyContent(FlexAlign.SpaceBetween)

      Divider()
        .width('90%')
        .strokeWidth(1.5)

      Row() {
        Button('缩小')
          .width(80)
          .fontSize(20)
          .onClick(() => {
            if (this.imageWidth > 10) {
              this.imageWidth -= 10
            }
          })
        Button('放大')
          .width(80)
          .fontSize(20)
          .onClick(() => {
            if (this.imageWidth < 300) {
              this.imageWidth += 10
            }
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({top: 35, bottom: 35})



      Slider({
        min: 100,
        max: 300,
        step: 10,
        value: this.imageWidth
      })
        .width('90%')
        .trackThickness(7)
        .showTips(true)
        .blockColor('#36D')
        .onChange(value => {
          this.imageWidth = value
        })
    }
    .width('100%')
    .height('100%')
  }
}