class Item {
  name: string
  image: ResourceStr
  price: number
  discount: number

  constructor(name: string, image: ResourceStr, price: number, discount: number = 0) {
    this.name = name
    this.image = image
    this.price = price
    this.discount = discount
  }
}

import {Header} from '../components/CommonComponents'

@Entry
@Component
struct ItemPage {
  // 商品数据
  private items: Array<Item> = [
    new Item('华为Mate60', $r('app.media.mate60'), 6999, 500),
    new Item('MateBookProX', $r('app.media.mateBookProX'), 13999),
    new Item('WatchGT4', $r('app.media.watchGT4'), 1438),
    new Item('FreeBuds Pro3', $r('app.media.freeBudsPro3'), 1499),
    new Item('Mate X5', $r('app.media.mateX5'), 12999),
    new Item('WatchGT4', $r('app.media.watchGT4'), 1438),
    new Item('FreeBuds Pro3', $r('app.media.freeBudsPro3'), 1499),
    new Item('Mate X5', $r('app.media.mateX5'), 12999)
  ]



  build() {
    Column({space: 8}) {
      Header({title: '商品列表'}).margin({bottom: 20})

      List({space: 8}) {
        ForEach(
          this.items,
          (item: Item) => {
            ListItem() {
              this.ItemCard(item)
            }
          }
        )
      }
      .width('100%')
      .layoutWeight(1)  // TODO 布局权重
    }
    .fillScreen()
  }

  // 局部自定义构建函数
  @Builder  ItemCard(item: Item) {
    Row({space: 10}) {
      Image(item.image)
        .width(100)
      Column({space: 4}) {
        Text(item.name)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        if (item.discount) {
          Text('原价：￥ ' + item.price)
            .fontSize(14)
            .fontColor('#ccc')
            .decoration({type: TextDecorationType.LineThrough})
          Text('折扣价：￥ ' + (item.price - item.discount)).priceText()
          Text('补贴：￥ ' + item.discount).priceText()
        } else {
          Text('￥ ' + item.price).priceText()
        }
      }
      .height('100%')
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .backgroundColor('#FFF')
    .height(120)
    .padding(10)
    .borderRadius(20)
  }

  // 局部公共样式函数
  @Styles fillScreen() {
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#EFEFEF')
  }
}

// 全局自定义构建函数
// @Builder function ItemCard(item: Item) {
//   Row({space: 10}) {
//     Image(item.image)
//       .width(100)
//     Column({space: 4}) {
//       Text(item.name)
//         .fontSize(20)
//         .fontWeight(FontWeight.Bold)
//       if (item.discount) {
//         Text('原价：￥ ' + item.price)
//           .fontSize(14)
//           .fontColor('#ccc')
//           .decoration({type: TextDecorationType.LineThrough})
//         Text('折扣价：￥ ' + (item.price - item.discount))
//           .fontSize(18)
//           .fontColor('#F36')
//         Text('补贴：￥ ' + item.discount)
//           .fontSize(18)
//           .fontColor('#F36')
//       } else {
//         Text('￥ ' + item.price)
//           .fontSize(18)
//           .fontColor('#F36')
//       }
//     }
//     .height('100%')
//     .alignItems(HorizontalAlign.Start)
//   }
//   .width('100%')
//   .backgroundColor('#FFF')
//   .height(120)
//   .padding(10)
//   .borderRadius(20)
// }

// 全局公共样式函数
// @Styles function fillScreen() {
//   .width('100%')
//   .height('100%')
//   .padding(20)
//   .backgroundColor('#EFEFEF')
// }

// 样式的继承模式。只能是全剧
@Extend(Text) function priceText() {
  .fontSize(18)
  .fontColor('#F36')
}