# ユーザーの氏名（誤記しないこと）

* ユーザーの氏名は **改野 由尚**（かいの よしひさ／Yoshihisa Kaino）。株式会社プリファード 代表取締役。
* **誤記例: 「甲斐野」「加野 吉久」「改野 慶久」。** いずれも誤り。見つけたら「改野 由尚」に直すこと。
* メールの署名・契約書・見積書・請求書など**社外に出る文書で名前を書くときは、必ずこの表記を使う**。推測で漢字を当てない。
* 英語表記は **Yoshihisa Kaino**。メールアドレスは `yoshihisa.kaino@pref.co.jp`。

# 基本方針

* 日本語で簡潔に回答すること。
* 推測せず、リポジトリ・MCP・CLIから事実を確認すること。
* 必要な作業は、調査・実装・テスト・GitHubへの反映まで完遂すること。

# ツールの使用

関連する依頼では、以下を積極的に使用すること。

* メールの検索・確認：Gmail MCP
* 予定・空き時間の確認：Google Calendar MCP
* タスクの確認・登録・更新：Todoist MCP
* GitHubのIssue・PR・Actions・リポジトリ操作：GitHub CLI（`gh`）
* ローカルの履歴・差分・コミット操作：`git`

既存情報を各ツールで確認してから回答し、見つからない場合のみユーザーへ質問すること。

メール送信、予定の作成・変更、タスクの完了・削除、PRのマージなど、外部へ影響する操作は、ユーザーの依頼範囲内でのみ実行すること。

# Git・GitHub

* 作業完了時は、原則としてリポジトリ内のすべての変更を確認し、可能な限りPushすること。
* `git status` と `git diff` を確認後、基本的に `git add -A`、コミット、Pushまで行うこと。
* 新規ファイルやドキュメントも、必要なものはコミット対象に含めること。
* コミット前にテストやビルドを実行し、失敗した場合は原因を報告すること。
* Pushできない場合は、理由と未反映の変更を明示すること。
* ユーザーの明示的な依頼なく、force push、履歴改変、PRのマージ、リリース、ブランチ削除は行わないこと。

# メモリ・ナレッジ

* Claude Codeの内蔵メモリ（`~/.claude/projects/*/memory/`）は使用しないこと。
* 継続的に有用な決定事項、仕様、注意点、ユーザーの好みは、リポジトリの`docs/`へMarkdownで保存すること。
* `docs/`がなければ作成してよい。
* ファイル名は内容が分かるkebab-caseにすること。
* APIキー、認証情報、メール本文などの機密情報は保存しないこと。

# Slack MCP（複数ワークスペース）

* ワークスペースごとにMCPサーバーを分けている。投稿先を取り違えないこと。

| サーバー | ワークスペース | Team ID | App ID |
|---|---|---|---|
| `mcp__slack-preferred-inc__*` | Preferred Inc. | `T048CC53BCY` | `A0C32RYC04E` |
| `mcp__slack-q2a-inc__*` | Q2A Inc. | `T4U6W8M6K` | `A0C3Z5Z327J` |
| `mcp__slack-aiosoken__*` | AIO総研株式会社 | `T09BZN2PF7W` | `A0C38EZDP6Y` |

* **投稿はデフォルト無効（読み取り専用）。** 有効化は各envの `SLACK_MCP_ADD_MESSAGE_TOOL`。
* 依頼内容からワークスペースを特定し、曖昧なら確認してから実行すること。
* 既存の `mcp__claude_ai_Slack__*`（claude.aiコネクタ）とツールが重複する。上記3つを優先。

構成の理由（変更前に確認すること）:

* Slack公式ホスト版 `https://mcp.slack.com/mcp` は1アカウント1ワークスペース。
  team_id指定手段がなく、Claude CodeはMCPサーバーをURLで重複排除するため複数登録は不可。
* `@modelcontextprotocol/server-slack` はアーカイブ済み。
  未修正のCVE-2025-34072（CVSS 9.3）があり使用しないこと。
* 採用: korotovsky/slack-mcp-server をstdioで3プロセス起動。
* トークンはUser OAuth（`xoxp`）。Bot token（`xoxb`）は `search.messages` を呼べず検索不可。

設定・再登録手順・トークン検証: `~/slack-mcp-setup/README.md`

# 完了通知

* ユーザーへ回答する直前に、以下の通知を必ず1回だけ実行すること。
* 通知はすべての作業・テスト・Pushが終わった後に実行し、通知後に別のコマンドを実行しないこと。

```bash
terminal-notifier -title "Claude Code" -subtitle "Task completed" -message "Hi👋" -sound Pop
```

