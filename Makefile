# Устанавливаем переменную VENV для указания названия виртуального окружения
VENV = .venv
# Указываем путь до интерпретатора Python внутри виртуального окружения
PYTHON = $(VENV)/Scripts/python
# Указываем путь до менеджера пакетов pip внутри виртуального окружения
PIP = $(VENV)/Scripts/pip
# Обозначаем цели, которые не являются файлами. Это помогает избежать путаницы
.PHONY: run clean
# Определяем цель run, которая зависит от файла активации виртуального окружения
run:	$(VENV)/Scripts/activate
# Запускаем приложение app.py с использованием интерпретатора Python из виртуального окружения
	$(PYTHON) main.py

# Определяем цель активации виртуального окружения
$(VENV)/Scripts/activate:	requirements.txt
# Создаем виртуальное окружение с помощью команды venv
	python -m venv $(VENV)
# Устанавливаем зависимости из файла requirements.txt с помощью pip
	$(PIP) install -r requirements.txt
# Создаем файл .gitignore с символом * для добавления виртуального окружения в .gitignore
	echo * > $(VENV)/.gitignore
	printf "*\n.venv/\npycache/\n*.py[cod]\n*$py.class\n" > .gitignore

# Определяем цель clean для очистки проекта
clean:
# Удаляем директорию с кэшом Python
	rm -rf __pycache__
# Удаляем виртуальное окружение ()
	rm -rf $(VENV)