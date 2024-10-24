import router from '@ohos.router'

@Entry
@Component
struct Splash {

  aboutToAppear() {
    setTimeout(()=> {
      router.replaceUrl({ url: 'pages/Index'});
    }, 2000)
  }

  build() {
    Stack() {
      // 背景
      Image($r('app.media.earth'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)
        .hoverEffect(HoverEffect.None)
    }
  }
}