import dotenv 
import os

dir = dotenv.find_dotenv()
dotenv.load_dotenv(dir)

ENV_CONFIGS = {
    'development': {
        'base_url': 'https://now.westwing.com.br/',
        'headless': '--no-headless'
    },

    'staging': {
        'base_url': 'https://now-stage.wwbr.com.br/',
        'headless': '--headless'
    },

    'production': {
        'base_url': 'https://now.westwing.com.br/',
        'headless': '--headless'
    }
}

ENVIRONMENT = os.getenv('ENVIRONMENT')
BASE_URL = ENV_CONFIGS.get(ENVIRONMENT).get('base_url')
HEADLESS = ENV_CONFIGS.get(ENVIRONMENT).get('headless')

BUCKET_NAME = os.getenv('BUCKET_NAME')
SLACK_WEBHOOK = os.getenv('SLACK_WEBHOOK')

