import { router } from '@kit.ArkUI'
/**
 * 自定义App顶部Topbar
 */
@Component
export struct CommonTopBar{
  @Prop title : string
  @Prop alpha : number = 1
  @State statusBarHeight : number = 0
  private titleAlignment : TextAlign = TextAlign.Center
  private backButton : boolean = true
  private onBackClick ?: () => void

  build() {
    Column(){
      Blank().backgroundColor($r('app.color.color_red'))
        //opacity--不透明度
        .opacity(this.alpha)
      Stack({alignContent :Alignment.Start}){
        Stack().width('100%').height(50)
          .opacity(this.alpha)
          .backgroundColor($r('app.color.color_red'))
        Flex({direction : FlexDirection.Row,
        alignItems : ItemAlign.Center}){
          Text(this.title).flexGrow(1)
            .textAlign(this.titleAlignment)
            .fontColor($r('app.color.color_fff'))
            .fontSize(16)
            .align(Alignment.Center)
            .maxLines(1)
            //textOverflow文本溢出,Ellipsis省略号
            .textOverflow({overflow : TextOverflow.Ellipsis})
        }
        .height(50).margin({left : 50,right : 50})
        //alignSelf对齐自身
        .alignSelf(ItemAlign.Center)

        if (this.backButton){
          Stack(){
            Image($r('app.media.ic_action_back'))
              .width(16).height(16)
              .align(Alignment.Center)
              .onClick(()=>{
                this.onBackClick?.()
                router.back();
              })
          }.width(50)
          .height(50)
        }
      }.width('100%')
      .height(50)
    }.height(this.statusBarHeight)
  }
}