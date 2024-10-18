import { ViewStateConstant } from '../constants/ViewStateConstant';
import { CommonSkeleton } from '../skelton/CommonSkeleton';


@Component
export struct StateComponent{
  @Prop viewState : string;
  //页面内容区域组件
  @BuilderParam viewContent : () => void
  //重试的回调方法
  retryCallback?: () => void
  //是否骨架屏幕
  private showSkeleton : boolean = false
  build() {
    Stack(){
      if (this.viewState != ViewStateConstant.VIEW_STATE_SUCCESS){
        this.holdContent()
      }else {
        this.viewContent()
      }
    }
  }
  @Builder holdContent(){
    if (this.showSkeleton && this.viewState == ViewStateConstant.VIEW_STATE_LOADING){
      CommonSkeleton()
    }else {
      Column(){
        Image(this.convertImage())
          .width('100vp').height('100vp')
        Text(this.convertValue())
          .fontSize('15fp')
          .fontColor($r('app.color.color_666'))
          .margin(10)
        if (this.viewState != ViewStateConstant.VIEW_STATE_LOADING) {
          Button($r('app.string.press_retry'))
            .width('120vp')
            .height('35vp')
            .backgroundColor($r('app.color.color_red'))
            .fontColor($r('app.color.color_fff'))
            .onClick(()=>{
              this.retryCallback?.()
            })
        }
      }
    }
  }
  /**
   * 转换文案
   * @returns
   */
  convertValue(){
    switch (this.viewState){
      case ViewStateConstant.VIEW_STATE_LOADING:
        return $r('app.string.loading')
      break;
      case ViewStateConstant.VIEW_STATE_ERROR:
        return $r('app.string.load_error')
      break;
      case ViewStateConstant.VIEW_STATE_NETWORK_ERROR:
        return $r('app.string.net_error')
      break;
      case ViewStateConstant.VIEW_STATE_EMPTY:
        return $r('app.string.load_emtpy')
      break;
      default:
        return $r('app.string.load_success')
      break;
    }
  }
  /**
   * 转换图片
   * @returns
   */
  convertImage(){
    switch (this.viewState){
      case ViewStateConstant.VIEW_STATE_LOADING:
        return $r('app.media.loading')
        break;
      case ViewStateConstant.VIEW_STATE_ERROR:
        return $r('app.media.common_empty_content')
        break;
      case ViewStateConstant.VIEW_STATE_NETWORK_ERROR:
        return $r('app.media.timeout')
        break;
      case ViewStateConstant.VIEW_STATE_EMPTY:
        return $r('app.media.common_empty_content')
        break;
      default:
        return $r('app.media.loading')
        break;
    }
  }
}