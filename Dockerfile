# inherit prebuilt image
#Changed docker file
FROM elytra8/fizfed:latest

# env setup
RUN mkdir /Fizilion && chmod 777 /Fizilion
ENV PATH="/Fizilion/bin:$PATH"
WORKDIR /Fizilion

# clone repo
RUN git clone https://github.com/LuckyRajputOP/VibeXUserbot -b demon /VibeXUserbot
#RUN git clone https://github.com/LuckyRajputOP/VibeXUserbot -b dragon /VibeXUserbot

# Copies session and config(if it exists)
COPY ./sample_config.env ./userbot.session* ./config.env* /Fizilion/

# install required pypi modules
RUN pip3 install -r requirements.txt

# Finalization
CMD ["python3","-m","userbot"]
