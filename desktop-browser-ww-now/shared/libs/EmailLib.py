from requests import get

__version__ = '1.0'

__scope__ = 'GLOBAL'


class EmailLib (object):
    ROBOT_LIBRARY_VERSION = __version__
    ROBOT_LIBRARY_SCOPE = __scope__

    def get_random_email(self) -> str:
        email = get(
            "https://www.1secmail.com/api/v1/?action=genRandomMailbox&count=1").json()[0]
        return email
