import requests


def get_number():
    api_url: str = 'http://numbersapi.com/random/year'
    response = requests.get(url=api_url)

    if response.status_code == 200:
        print(response.text)
    else:
        print(f'Ошибка во время запроса: \n{response.status_code}')
