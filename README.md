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

- Once you clone the repository:

cd calendar_caldav

If you don't have already exitsing caldav server running :
- Make sure that you have python enviromint on you machine 
- Run `radicale` as root privilege to run the caldav server
- In new terminal run the following commands :  

```

bundle i

rails db:create

rails db:migrate

rails s

```


You are ready to go!
