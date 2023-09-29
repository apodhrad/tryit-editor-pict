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

COPY --from=builder / /

USER 1001

ENTRYPOINT ["tryit-editor"]

CMD ["start", "-c", "/var/tryit-editor/services.yaml"]
