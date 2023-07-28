#  ____        _ _     _           
# | __ ) _   _(_) | __| | ___ _ __ 
# |  _ \| | | | | |/ _` |/ _ \ '__|
# | |_) | |_| | | | (_| |  __/ |   
# |____/ \__,_|_|_|\__,_|\___|_|   
#                                  
FROM quay.io/apodhrad/pict:latest as builder

#  __  __       _       
# |  \/  | __ _(_)_ __  
# | |\/| |/ _` | | '_ \ 
# | |  | | (_| | | | | |
# |_|  |_|\__,_|_|_| |_|
#
FROM quay.io/apodhrad/tryit-editor:latest

COPY --from=builder /usr/local/bin/pict /usr/local/bin/pict-orig

COPY pict-html.sh /usr/local/bin/pict

COPY services.yaml example.txt /tmp/

USER tryit-editor

ENTRYPOINT ["tryit-editor"]

CMD ["start", "-c", "/tmp/services.yaml"]
