FROM python:3

COPY requirements.txt ./requirements.txt

COPY serve.py ./serve.py

RUN python3 -m pip install -r requirements.txt
RUN wget https://the-eye.eu/public/AI/GPT-J-6B/step_383500_slim.tar.zstd
RUN sudo apt install zstd
RUN tar -I zstd -xf step_383500_slim.tar.zstd
RUN rm step_383500_slim.tar.zstd

CMD ["python3", "./serve.py"]
