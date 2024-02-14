@Entry
@Component
struct PropPage3 {

  @State stat: StatInfo = new StatInfo()


  build() {
    Column({space: 10}) {
      // 1 任务进度卡片
      TaskStatistics({totalTask: this.stat.totalTask, finishTask: this.stat.finishTask})

      // 2 任务列表  @Link类型的属性是双向数据传输，需要使用$符号
      TaskList({stat: $stat})

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F2F3')
  }


}

// 任务统计信息
class StatInfo {
  // 总任务数量
  totalTask: number = 0
  // 以完成任务数量
  finishTask: number = 0
}

class Task {
  static id: number = 1;
  // 任务名称
  name: string = `任务${Task.id++}`
  // 任务状态：是否完成
  finished: boolean = false
}

// 统一卡片样式
@Styles function card() {
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4})
}

// 任务完成样式
@Extend(Text) function finishedTask() {
  .decoration({type: TextDecorationType.LineThrough})
  .fontColor('#B1B2B1')
}


// 任务统计组件
@Component
struct TaskStatistics {
  // 总任务数量
  @Prop totalTask: number
  // 以完成任务数量
  @Prop finishTask: number

  build() {
    Row() {
      Text('任务进度：')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)

      Stack() {
        Progress({
          value: this.finishTask,
          total: this.totalTask,
          type: ProgressType.Ring
        })
          .width(100)

        Row() {
          Text(this.finishTask.toString())
            .fontSize(24)
            .fontColor('#36D')
          Text('/' + this.totalTask.toString())
            .fontSize(24)
            .fontColor('#36D')
        }
      }
    }
    .card()
    .margin({top: 20, bottom: 10})
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}

// 任务列表组件
@Component
struct TaskList {
  @Link stat: StatInfo
  // 任务数组
  @State tasks: Task[] = []

  build() {
    Column() {
      // 2 新增任务按钮
      Button('新增任务')
        .width(200)
        .onClick(() => {
          this.tasks.push(new Task())
          this.handleTaskChange()
        })

      // 3 任务列表
      List({space: 10}) {
        ForEach(
          this.tasks,
          (item: Task, index) => {
            ListItem() {
              Row() {
                Text(item.name)
                  .fontSize(20)
                Checkbox()
                  .select(item.finished)
                  .onChange(val => {
                    // 更新当前任务状态
                    item.finished = val
                    // 更新已完成任务数量
                    this.handleTaskChange()
                  })
              }
              .card()
              .justifyContent(FlexAlign.SpaceBetween)
            }
            .swipeAction({end: this.DeleteButton(index)})
          }
        )
      }
      .width('100%')
      .alignListItem(ListItemAlign.Center)
      .layoutWeight(1)

    }
  }

  handleTaskChange() {
    // 更新任务总数量
    this.stat.totalTask = this.tasks.length
    // 更新已完成任务数量
    this.stat.finishTask = this.tasks.filter(item => item.finished).length
  }

  @Builder DeleteButton(index: number) {
    Button() {
      Image($r('app.media.ic_public_delete'))
        .fillColor(Color.White)
        .width(20)
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin(5)
    .onClick(() => {
      this.tasks.splice(index, 1)
      this.handleTaskChange()
    })
  }

}