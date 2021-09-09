#Base image
FROM ubuntu


#update the image
RUN apt-get update

#install python
RUN apt install -y python3.9
RUN apt install -y python3-pip

#install robotframework and seleniumlibrary
RUN pip3 install robotframework
RUN pip3 install robotframework-seleniumlibrary
RUN pip3 install allure-robotframework

#The followig are needed for Chrome and Chromedriver installation
RUN apt-get install -y xvfb 
RUN apt-get install -y zip 
RUN apt-get install -y wget 
RUN apt-get install ca-certificates 
RUN apt-get install -y libnss3-dev libasound2 libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb
#RUN dpkg -i google-chrome*.deb
RUN rm google-chrome*.deb
RUN wget -N http://chromedriver.storage.googleapis.com/92.0.4515.43/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN chmod +x chromedriver
RUN cp /chromedriver /usr/local/bin
RUN rm chromedriver_linux64.zip

RUN mkdir /app
WORKDIR /app/TestCases/WebTestCases/

COPY . /app
ENTRYPOINT ["robot","--listener","allure_robotframework;../../Report/output/allure","addition.robot"]
#ENTRYPOINT ["robot","-d","../../Report","addition.robot"]

#docker build -t framework/dockerpython .
#docker build -t framework/dockerpythonallure .

#docker run -it framework/dockerpython

#docker run -it -v %cd%/Report/output/allure/:/app/Report/output/allure/ framework/dockerpythonallure
#docker run -it -v %cd%/Report/:/app/Report/ framework/dockerpython

#docker run -it --entrypoint /bin/bash framework/dockerpython


#robot --listener allure_robotframework --listener Python_Listener.py ./ addition.robot
#robot -r ../Report/report.html -o ../Report/output.xml -l ../Report/log.html SeleniumEasy.robot
#robot --outputdir ../../Report SeleniumEasyDataDriver.robot