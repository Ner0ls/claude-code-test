<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Notes</title>
  <script src="https://unpkg.com/htmx.org@1.9.12"></script>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: system-ui, sans-serif;
      background: #f5f5f5;
      color: #222;
      min-height: 100vh;
      padding: 2rem 1rem;
    }

    .container {
      max-width: 560px;
      margin: 0 auto;
    }

    h1 {
      font-size: 1.6rem;
      font-weight: 700;
      margin-bottom: 1.5rem;
    }

    form {
      display: flex;
      gap: 0.5rem;
      margin-bottom: 1.5rem;
    }

    input[type="text"] {
      flex: 1;
      padding: 0.55rem 0.75rem;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 1rem;
      background: #fff;
    }

    input[type="text"]:focus {
      outline: none;
      border-color: #555;
    }

    button[type="submit"] {
      padding: 0.55rem 1rem;
      background: #222;
      color: #fff;
      border: none;
      border-radius: 6px;
      font-size: 1rem;
      cursor: pointer;
    }

    button[type="submit"]:hover { background: #444; }

    #notes-list {
      display: flex;
      flex-direction: column;
      gap: 0.5rem;
    }

    .note {
      display: flex;
      align-items: center;
      justify-content: space-between;
      background: #fff;
      border: 1px solid #ddd;
      border-radius: 6px;
      padding: 0.65rem 0.75rem;
    }

    .note span {
      flex: 1;
      word-break: break-word;
    }

    .note button {
      background: none;
      border: none;
      color: #999;
      font-size: 1.1rem;
      cursor: pointer;
      padding: 0 0.25rem;
      line-height: 1;
      flex-shrink: 0;
    }

    .note button:hover { color: #c00; }

    .empty {
      color: #999;
      font-size: 0.95rem;
      text-align: center;
      padding: 1.5rem 0;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Notes</h1>

    <form hx-post="/notes"
          hx-target="#notes-list"
          hx-swap="afterbegin"
          hx-on::after-request="this.reset()">
      <input type="text" name="text" placeholder="Write a note..." autocomplete="off" required>
      <button type="submit">Add</button>
    </form>

    <div id="notes-list">
      % if notes:
        % for note_id, text in notes.items():
          <%include('note', note_id=note_id, text=text)%>
        % end
      % else:
        <p class="empty">No notes yet.</p>
      % end
    </div>
  </div>
</body>
</html>
