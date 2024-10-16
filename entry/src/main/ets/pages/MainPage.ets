import { TabItem } from '../model/TabItem';
import { FindPage } from './find/FindPage';
import { HomePage } from './home/HomePage';
import { HotPage } from './hot/HotPage';
import { MinePage } from './mine/MinePage';
import MainViewModel from '../viewmodel/MainViewModel'

/**
 * 底部导航
 */
@Entry
@Component
struct MainPage {
  @State selectedIndex :number = 0
  @Provide homeTabsSelected : number = 0

  build() {
    Column(){
      Tabs({
        index : this.selectedIndex,
        barPosition : BarPosition.End
      }){
        TabContent(){
          HomePage()
        }.tabBar(this.TabBottom(MainViewModel.tabTitle[0],0))

        TabContent(){
          FindPage()
        }.tabBar(this.TabBottom(MainViewModel.tabTitle[1],1))

        TabContent(){
          HotPage()
        }.tabBar(this.TabBottom(MainViewModel.tabTitle[2],2))

        TabContent(){
          MinePage()
        }.tabBar(this.TabBottom(MainViewModel.tabTitle[3],3))

      }.barMode(BarMode.Fixed)
      .barWidth('100%')
      .scrollable(false)
      .barHeight('56vp')
      .onChange((index : number)=>{
        this.selectedIndex = index;
        this.homeTabsSelected = index
      })
    }
  }
  @Builder TabBottom(item : TabItem,index : number){
    Column(){
      Image(this.selectedIndex == index?item.imageActivated : item.imageOriginal)
        .width(20).height(20)
        .margin({top : 8,bottom : 5})
      Text(item.title).width('100%').height(14)
        .fontSize(10).fontWeight(500)
        .fontColor(this.selectedIndex == index?$r('app.color.color_red') : Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({bottom : 7})
    }.justifyContent(FlexAlign.Center)
    .height('100%').width('100%')
    .backgroundColor($r('app.color.color_f5f5f5'))
  }
}