from bottle import Bottle, request, template, response
import uuid

app = Bottle()

notes = {}


@app.route('/')
def index():
    return template('views/index', notes=notes)


@app.post('/notes')
def add_note():
    text = request.forms.get('text', '').strip()
    if not text:
        return ''
    note_id = str(uuid.uuid4())[:8]
    notes[note_id] = text
    return template('views/note', note_id=note_id, text=text)


@app.delete('/notes/<note_id>')
def delete_note(note_id):
    notes.pop(note_id, None)
    return ''


if __name__ == '__main__':
    app.run(host='localhost', port=8080, debug=True, reloader=True)
