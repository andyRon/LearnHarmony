class Person {
  name: string
  age: number
  gf: Person

  constructor(name: string, age: number, gf?: Person) {
    this.name = name
    this.age = age
    this.gf = gf
  }
}

@Entry
@Component
struct StatePage3 {
  idx: number = 1;
  @State p: Person = new Person('andy', 23)
  @State gfs: Person[] = [
    new Person('丽丽', 19),
    new Person('露西', 20)
  ]

  build() {
    Column() {
      Text(`${this.p.name}:${this.p.age}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .fontColor('#65D')
        .onClick(() => {
          this.p.age++
        })
      Button('添加')
        .onClick(() => {
          this.gfs.push(new Person('女友' + this.idx++, 20))
        })
      Text('===女友列表===')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)

      ForEach(
        this.gfs,
        (p, index) => {
          Row() {
            Text(`${p.name}:${p.age}`)
              .fontSize(30)
              .onClick(() => {
                p.age++
              })
            Button('删除')
              .onClick(() => {
                this.gfs.splice(index, 1)
              })
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceAround)
        }
      )

    }
    .height('100%')
    .width('100%')
    .padding(20)
    }

}

// @Entry
@Component
struct StatePage2 {
  @State p: Person = new Person('andy', 18, new Person('rose', 16))

  build() {
    Row() {
      Column() {
        Text(`${this.p.name}:${this.p.age}`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor('#65D')
          .onClick(() => {
            this.p.age++
          })
        // 嵌套类型无法触发视图更新
        Text(`${this.p.gf.name}:${this.p.gf.age}`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor('#65D')
          .onClick(() => {
            this.p.gf.age++
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}


// @Entry
@Component
struct StatePage {
  @State name: string = 'andy'
  @State age: number = 23

  build() {
    Row() {
      Column() {
        Text(`${this.name}:${this.age}`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor('#65D')
          .onClick(() => {
            this.age++
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}