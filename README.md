# FastAPI + poetry2nix Example

Example repo getting [poetry2nix](https://github.com/nix-community/poetry2nix/tree/master) up and running with FastAPI.

The `flake.nix` file was generated using the flake template from `poetry2nix`:
```bash
nix flake init --template github:nix-community/poetry2nix
```

## Requirements
- [nix](https://zero-to-nix.com/start/install)

## Development Shell
```bash
❯ nix develop
❯ (nix:python3.10-fastapi-nix-example-0.1.0-env) fastapi-nix-example$
```

## Build
To build the FastAPI app with nix, run:
```bash
❯ nix build
```

Once the build is complete, there will be a `result` directory where you can  start the FastAPI app by running:
```bash
❯ ./result/bin/app 
INFO:     Uvicorn running on http://0.0.0.0:8000 (Press CTRL+C to quit)
INFO:     Started reloader process [42115] using StatReload
INFO:     Started server process [42119]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
```
