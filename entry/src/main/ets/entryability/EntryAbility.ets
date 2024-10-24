import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import WindowManager from '../utils/WindowManager';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import {TaoYao} from '@shijing/taoyao';

export default class EntryAbility extends UIAbility {

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    WindowManager.immerseFullScreenAsync(windowStage)
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Splash', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });

    //申请权限
    TaoYao.with(this)
      .runtime()
        // 要申请的权限
      .permission(["ohos.permission.INTERNET","ohos.permission.CAMERA","ohos.permission.READ_MEDIA","ohos.permission.WRITE_MEDIA","ohos.permission.GET_NETWORK_INFO","ohos.permission.VIBRATE","ohos.permission.MICROPHONE","ohos.permission.ACCESS_BLUETOOTH"])
      .onGranted(() => {
        // 权限申请成功
        console.log("权限申请成功")
      })
      .onDenied(() => {
        // 权限申请失败
        console.log("权限申请失败")
      })
      .request()
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
