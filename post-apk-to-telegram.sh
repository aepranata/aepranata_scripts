#!/bin/bash

notifit() {
    CAPTION="🚀 <b>A³ CI Build</b>

━━━━━━━━━━━━━━━━━━
📦 <b>App</b>: $APK_NAME
🌿 <b>Branch</b>: $GITHUB_REF_NAME
🔢 <b>Build No</b>: $GITHUB_RUN_NUMBER
🕒 <b>Build Time</b>: $BUILD_TIME
⏱ <b>Duration</b>: $BUILD_DURATION
━━━━━━━━━━━━━━━━━━

👤 <b>Author</b>: $COMMIT_AUTHOR
🔖 <b>Commit</b>:
[<a href=\"$COMMIT_URL\">$COMMIT_HASH</a>] $LAST_COMMIT

📊 <b>Build Info</b>
📁 Size: $APK_SIZE
⚙️  CI: GitHub Actions"

    curl -F document=@$APK_PATH \
         -F chat_id="$TG_CHAT_ID" \
         -F parse_mode=HTML \
         -F caption="$CAPTION" \
         https://api.telegram.org/bot$TG_BOT_TOKEN/sendDocument
}

notifit
