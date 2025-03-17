FROM elixir:otp-27-slim

WORKDIR ./app

RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

COPY . .

RUN mix deps.get
 
EXPOSE 8000

CMD ["mix", "run", "--no-halt"]
 
