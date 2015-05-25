FROM haskell:7.10

RUN cabal update

ADD robot.cabal /src/

WORKDIR /src

RUN cabal install --dependencies-only --enable-tests

ADD . /src

CMD ["cabal", "run"]
