# Calendar CalDav

> This repo contains Calender app integrated with [CalDAV](https://en.wikipedia.org/wiki/CalDAV) Server

## Built With

- Ruby on Rails
- [Twisted-caldav](https://github.com/int2root/twisted-caldav)
## Getting Started

To get a local copy up and running follow these simple example steps.

### Install

No extra dependencies needed to use the code!

### Test

- Ruby Linters 


```

rubocop

```




- Rspec Test Tool

``` 

rspec spec/

```


### Usage

- First you need to add CalDav server credentials at "config/constants.rb"
- Once you clone the repository:



```

cd calendar_caldav

bundle i

rails db:create

rails db:migrate

rails s

```


You are ready to go!
