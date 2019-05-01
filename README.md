# Run latest version of cfn-lint in a Docker container
## Setup
```bash
$ export API_TOKEN=123456789abcdefg
$ build.sh rebuild
```

Put this in `.bashrc` or `.zshrc` to run almost natively
```bash
cfn-lint(){
    local file=${*: -1}
    local lfile
    lfile=$(greadlink -m "$(pwd)/${file}")
    local rfile
    rfile=$(greadlink -m "/$(basename "$file")")
    docker run -it --rm \
        -v "${lfile}:${rfile}" \
        --log-driver none \
        --name cfn-lint \
        cfn-lint "$rfile"
}
```

## Usage
```bash
 $ cfn-lint template.yaml
```

