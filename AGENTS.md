## Plan Mode

- Make the plan extremely concise. Sacrifice grammar for the sake of concision.
- At the end of each plan, give me a list of unresolved questions to answer, if any.

## Tool preferences

- Always use `rg` (ripgrep) instead of `grep`.

## File paths

- Prefer relative paths inside of the project.

## Pull requests

- Use the templates on the repositories if there are any.
- Always open PRs in draft mode. The user decides when they are ready.

## Atlassian access

- Use `acli` for all Jira and Confluence operations.
- Prefer `acli` over browser-based access or other integrations.
- Never expose authentication tokens or credentials.
- When creating a Jira ticket, create it first, then explicitly update its description: Jira applies the issue type's default template after creation and overrides description content supplied during creation.

## Fresh remote base for new branches and worktrees

- Before creating any new task branch or worktree, fetch the intended remote successfully (`git fetch --prune origin` by default). Never use a cached remote-tracking ref without fetching it first.
- Resolve the remote's default branch from the remote itself, normally `main` or `master`. If both exist, use the remote's default rather than guessing. Use a different remote or base only when the user explicitly requests it.
- Create the new branch directly from the freshly fetched remote-tracking ref, such as `origin/main` or `origin/master`. Always supply that ref explicitly to branch/worktree creation commands or tools; never default to the current `HEAD` or local `main`/`master`.
- Immediately after creation and before making changes, verify that the new branch's `HEAD` equals the fetched base commit. Report the base ref and commit SHA with the branch creation result.
- If fetching fails, the base cannot be resolved, or verification fails, stop branch creation and explain the problem. Do not fall back to stale local refs.
- Preserve uncommitted changes and existing branches. Use an isolated worktree when necessary; never automatically stash, reset, overwrite, or rebase existing work to satisfy this rule. Continuing an explicitly requested existing branch or PR preserves that branch's history.
- Apply this requirement to skills, repository workflows, and delegated agents, including workflows that say to branch from the current `HEAD`. Include the fresh-base requirement when delegating branch or worktree creation.

## Planning and implementation model routing

- For a request that explicitly asks for a plan, or a coding task that needs multiple steps, delegate the initial read-only investigation and plan to the `planner` custom agent. It uses GPT-6.1 Sol.
- For code changes, pass the reviewed plan and relevant findings to the `implementer` custom agent. It uses GPT-6 Luna. Run this after planning, not in parallel with it.
- Keep the main thread responsible for coordinating the work, applying the user's and repository's instructions, and reviewing the result. The main thread's selected model does not change during this workflow.
- For straightforward requests that do not need a plan or code edits, respond directly without spawning these agents.

## Outward-facing prose

- Before posting a GitHub PR description, PR or issue comment, review comment, or Jira ticket description or comment, use the `clarity` skill in review mode on the draft, then apply fixes. Keep repository templates' headings and required sections intact.
- Do not invent facts, numbers, or links while rewriting. If the clarity pass would add a claim, leave it out and flag it.
- Show the final text before posting. Do not post without confirmation.
