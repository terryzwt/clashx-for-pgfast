FROM dreamacro/clash AS clashx

FROM tiredofit/alpine
ENV LANG="C.UTF-8" \
    LC_ALL="C.UTF-8" \
	GOTPL_VERSION=0.3.3 \
    SUBCONVERTER_VERSION=0.7.2

COPY --from=clashx /root/.config/clash/Country.mmdb /root/.config/clash/
COPY --from=clashx /clash /usr/bin/

RUN wget -O /tmp/subconverter.tar.gz "https://github.com/tindy2013/subconverter/releases/download/v${SUBCONVERTER_VERSION}/subconverter_linux64.tar.gz" && \
    tar xzvf /tmp/subconverter.tar.gz -C /root/ && \
    ## install gotpl 
    wget -O /tmp/gotpl.tar.gz "https://github.com/wodby/gotpl/releases/download/${GOTPL_VERSION}/gotpl-linux-amd64.tar.gz" && \
    tar xzvf /tmp/gotpl.tar.gz -C /usr/bin/ && \
    chmod +x /usr/bin/gotpl

ADD install /

EXPOSE 7890
EXPOSE 7891
EXPOSE 9090

ENTRYPOINT ["/init"]

#ENTRYPOINT ["/clash", "-c", "/root/.config/clash/", "-f", "/root/.config/clash/pgfast.yaml"]
