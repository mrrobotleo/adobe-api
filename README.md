# Adobe Analytics API

Get PageView metric from Adobe Analytics API using BASH

Adobe Analytics API - Explorer
https://marketing.adobe.com/developer/api-explorer

## Getting Started

Edit adobe-api.sh file with your Adobe Analytics API credentials
USERNAME="username:company"
PASSWORD="secret"

Edit adobe-api-pageview.json file with your reportSuiteID

### Prerequisites

Adobe Analytics API credentials - Your API Username and Shared Secret can be found under Account Information in the Web Service section of Adobe Analytics.
jq - https://stedolan.github.io/jq/download/

## Running the script

Linux Terminal

```
./adobe-api.sh adobe-api-pageview.json
```


## Authors

* **Leonardo Gloria da Silva** - **https://www.linkedin.com/in/leonardogloria/**
