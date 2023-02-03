FROM ubuntu

ENV jq_version="1.6"
ENV fzf_version="0.37.0"
ENV awscli_version="1.27.60"

RUN apt-get update && \
    apt-get install -y curl python3.10 python3-pip && \
    curl -sOL "https://github.com/stedolan/jq/releases/download/jq-${jq_version}/jq-linux64" && cp jq-linux64 /usr/local/bin/jq && chmod +x /usr/local/bin/jq && \
    curl -sOL "https://github.com/junegunn/fzf/releases/download/${fzf_version}/fzf-${fzf_version}-linux_amd64.tar.gz" && tar -xvzf "fzf-${fzf_version}-linux_amd64.tar.gz" && cp fzf /usr/local/bin/fzf && chmod +x /usr/local/bin/fzf && \
    pip install "awscli==${awscli_version}"

ADD cloudtrail-event-fuzzy-viewer .
RUN chmod +x cloudtrail-event-fuzzy-viewer
ENTRYPOINT ["./cloudtrail-event-fuzzy-viewer"]
