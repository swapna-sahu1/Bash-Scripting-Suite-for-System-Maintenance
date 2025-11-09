#!/bin/bash

LOG_FILES="/var/log/syslog /var/log/auth.log"
ALERT_LOG="alerts-$(date +%Y-%m-%d).log"

BOT_TOKEN="8520329986:AAH_lk_sukHJ0IUYCCLlrTLDF73nDD2DJJY"
CHAT_ID="1274528637"

send_telegram_alert() {
curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
-d chat_id="$CHAT_ID" \
-d text="⚠️ ALERT: System errors detected on $(hostname)! Check: $ALERT_LOG"
}

echo "🔍 Checking system logs..."

> "$ALERT_LOG"

for FILE in $LOG_FILES
do
  if [ -f "$FILE" ]; then
    grep -Ei "error|failed|critical|panic|segfault|denied|refused|fatal" "$FILE" >> "$ALERT_LOG"
  fi
done

if [ -s "$ALERT_LOG" ]; then
   echo "[ $(date) ] ⚠️ Issues found — sending Telegram alert..."
   send_telegram_alert
else
   echo "[ $(date) ] ✅ No errors found."
   rm "$ALERT_LOG" 2>/dev/null
fi

