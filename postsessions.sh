while [ 1 -eq 1 ]; do
    curl -X POST 192.168.126.232/session -d '{"value": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiZXhwIjoxNTA4Njc0MDEwLCJhZG1pbiI6dHJ1ZX0.-10PdB3qo4hXq0vt0Gp-Mo5-ek3VLKFYyGPcwfDkB0Q"}'
    sleep 1
done
