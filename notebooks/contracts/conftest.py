"""Pytest collector for jupytext percent-format (.py) notebooks.

Executes each notebook in-memory using jupytext + nbclient,
so no .ipynb conversion is needed on disk.
"""

import pytest
import jupytext
from nbclient import NotebookClient


def pytest_collect_file(parent, file_path):
	"""Collect .py percent-format notebooks as test items."""
	if file_path.suffix == ".py" and file_path.name != "conftest.py":
		first_line = file_path.read_text().split("\n", 1)[0]
		if first_line.startswith("# ---"):
			return NotebookFile.from_parent(parent, path=file_path)


class NotebookFile(pytest.File):
	def collect(self):
		yield NotebookItem.from_parent(self, name=self.path.stem)


class NotebookItem(pytest.Item):
	def runtest(self):
		nb = jupytext.read(str(self.path))
		client = NotebookClient(nb, timeout=600, kernel_name="python3")
		client.execute()

	def repr_failure(self, excinfo):
		return f"Notebook {self.path.name} failed:\n{excinfo.getrepr()}"

	def reportinfo(self):
		return self.path, 0, f"notebook: {self.path.name}"
