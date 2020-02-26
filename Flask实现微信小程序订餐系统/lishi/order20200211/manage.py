from application import app, manager
from flask_script import Server
import www

manager.add_command("runserver", Server(host=app.config['SERVER_HOST'], port=app.config['SERVER_PORT']))

def main():
    # app.run(host="0.0.0.0", debug=True)
    manager.run()

if __name__ == '__main__':
    try:
        import sys
        sys.exit(main())
    except Exception as e:
        import traceback
        traceback.print_exc()