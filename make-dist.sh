#!/usr/bin/env sh

git submodule update --init --remote

pushd docs-extensions
python3 -m venv .venv && source .venv/bin/activate
python -m pip install -r requirements.in
sphinx-build -E -b dirhtml source build/dirhtml
cp build/dirhtml/objects.inv ../dist/docs-extensions_objects.inv
deactivate
popd

pushd docs-intel-center
python3 -m venv .venv && source .venv/bin/activate
python -m pip install -r requirements.in
git submodule update --init --remote
sphinx-build -E -b dirhtml source build/dirhtml
cp build/dirhtml/objects.inv ../dist/docs-intel-center_objects.inv
deactivate
popd

pushd security-advisories
python3 -m venv .venv && source .venv/bin/activate
python -m pip install -r requirements.in
git submodule update --init --remote
sphinx-build -E -b dirhtml source build/dirhtml
cp build/dirhtml/objects.inv ../dist/security-advisories_objects.inv
deactivate
popd
