/**
 * 通用骨架屏
 * BuilderParams只能支持一个参数，多个参数不支持闭包的写法
 */

@Component
export struct CommonSkeleton{
  @State dataList : Array<string> = new Array(5)

  aboutToAppear(): void {
    for (let index = 0 ; index < 3; index++){
      this.dataList.push("")
    }
  }

  build() {
    List({space : 10}){
      ForEach(this.dataList,(item : string,index)=>{
        ListItem(){
          this.itemBuild()
        }
      })
    }.width('100%')
    .height('100%')
  }
  @Builder itemBuild(){
    Column(){
      Image($r('app.media.back_placeholder'))
        .width('100%')
        .height('200vp')
        .border({radius : '5vp'})
      Stack().width('90%').height('25vp')
        .backgroundColor($r('app.color.color_f5f5f5'))
        .margin({top : '10vp'})
      Stack().width('70%').height('25vp')
        .backgroundColor($r('app.color.color_f5f5f5'))
        .margin({top : '5vp'})
    }.alignItems(HorizontalAlign.Start)
  }
}