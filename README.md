# A bash script that helps setting up a new Mac

If you download and run `mac-setup.sh`, it takes care of 
- installing and setting up Homebrew,
- installing apps with Homebrew that are in the lists `casks` and `packages` in the script
- installing apps from the AppStore that are in the `appStoreApps` list in the script
- setting the default browser to the one specified as `DEFAULT_BROWSER` in the script

## Usage

- For every part of the script to work, make sure to add the termial app you'll be running `mac-setup.sh` from to the Accessibility list (System Settings -> Privacy & Security -> Accessibility).
- Clone the repo and run `mac-setup.sh` from the terminal app you added to the Accesibility list in the previous step.
- Address any interaction that might be needed during the script execution.
- Profit.

---

MIT License

Copyright (c) 2023 István Juhos

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
