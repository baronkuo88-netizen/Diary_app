# 日記應用 (Diary App) - 19週專案

這是我們的 Flutter 日記 App 雲端總部。

## 📦 資料庫結構定義 (Data Model)
後端定義的單篇日記 JSON 格式如下，前端在刻 UI 時請參考這些欄位：

```json
{
  "id": "uuid-12345",           // 日記唯一 ID
  "title": "今天天氣真好",        // 日記標題
  "content": "今天終於把 GitHub 設好了...", // 日記內容
  "mood": "happy",              // 心情標籤 (預設: happy, normal, sad)
  "created_at": "2026-03-11T14:30:00Z" // 建立時間
}
