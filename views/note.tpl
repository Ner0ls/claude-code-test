<div class="note" id="note-{{note_id}}">
  <span>{{text}}</span>
  <button hx-delete="/notes/{{note_id}}"
          hx-target="#note-{{note_id}}"
          hx-swap="outerHTML"
          aria-label="Delete note">&#x2715;</button>
</div>
