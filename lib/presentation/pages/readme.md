This folder contains all the pages like in this case the tabs. Each page contains
different Widget (single Elements) which are stored in the widgets folders (if they are big enough,
a TextBox wont be an one widget)
The important part is that each Widget contains an Observer that watches whether the information changes
Those information changes can cause an action via the store that is informed of the change (e.g login input).
A page doesnt take any action or cares about the data its presenting.