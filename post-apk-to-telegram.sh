#!/bin/bash

notifit() {
    CAPTION="🚀 *Larisin CI Build*

━━━━━━━━━━━━━━━━━━
📦 *App*: $APK_NAME
🌿 *Branch*: $GITHUB_REF_NAME
🔢 *Build No*: $GITHUB_RUN_NUMBER
🕒 *Build Time*: $BUILD_TIME
⏱ *Duration*: $BUILD_DURATION
━━━━━━━━━━━━━━━━━━

👤 *Author*: $COMMIT_AUTHOR
🔖 *Commit*: [$COMMIT_HASH - $LAST_COMMIT]($COMMIT_URL)

📊 *Build Info*
📁 Size: $APK_SIZE
⚙️  CI: GitHub Actions"

    curl -F document=@$APK_PATH \
         -F chat_id="$TG_CHAT_ID" \
         -F parse_mode=Markdown \
         -F caption="$CAPTION" \
         https://api.telegram.org/bot$TG_BOT_TOKEN/sendDocument
}

notifit
