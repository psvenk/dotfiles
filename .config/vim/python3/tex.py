import vim
from datetime import datetime
from os import path
from subprocess import run, DEVNULL

def include_screenshot():
    directory = path.dirname(vim.current.buffer.name)
    timestamp = datetime.now().strftime("%Y-%m-%d-%H-%M-%S")
    filename = f"screenshot-{timestamp}.png"
    with open(path.join(directory, filename), mode="wb") as outfile:
        run(["maim", "-s"], stdin=DEVNULL, stdout=outfile, stderr=DEVNULL)
    return filename
