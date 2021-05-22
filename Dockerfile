# inherit prebuilt image
#Changed docker file
FROM LuckyRajputOP/VibeXUserbot:latest

# env setup
RUN mkdir /VibeXUserbot && chmod 777 /VibeXUserbot
ENV PATH="/VibeXUserbot/bin:$PATH"
WORKDIR /VibeXUserbot

# clone repo
RUN git clone https://github.com/LuckyRajputOP/VibeXUserbot -b demon /VibeXUserbot
#RUN git clone https://github.com/LuckyRajputOP/VibeXUserbot -b dragon /VibeXUserbot

# Copies session and config(if it exists)
COPY ./sample_config.env ./userbot.session* ./config.env* /VibeXUserbot/

# install required pypi modules
RUN pip3 install -r requirements.txt

# Finalization
CMD ["python3","-m","userbot"]
