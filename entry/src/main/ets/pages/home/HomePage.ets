import { CommonTopBar } from '../../views/CommonTopBar';

/**
 * 首页
 */

@Entry
@Component
export struct HomePage {
  @State message: string = 'Hello World';

  build() {
    Column(){
      CommonTopBar({title : '首页',backButton : false,alpha :1})
        .align(Alignment.TopStart)
      Stack(){

      }
    }
  }
}