#!/bin/sh
#
# lf preview script.
# Adapted from: https://github.com/gokcehan/lf/wiki/Ranger

set -C -f -u
IFS=$'\n'

# ANSI color codes are supported.
# STDIN is disabled, so interactive scripts won't work properly

# Script arguments
FILE_PATH="${1}"  # Full path of the highlighted file

FILE_EXTENSION="${FILE_PATH##*.}"
FILE_EXTENSION_LOWER="$(printf "${FILE_EXTENSION}" | tr "[:upper:]" "[:lower:]")"

# Settings
# HIGHLIGHT_SIZE_MAX=262143  # 256KiB
BSDTAR_SIZE_MAX=524288000  # 500 MiB


handle_extension() {
    # Preview based on the file extension.
    case "${FILE_EXTENSION_LOWER}" in
        # Archive
        a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
        rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
            if [ "$(stat --dereference --printf="%s" -- "${FILE_PATH}")" -gt "${BSDTAR_SIZE_MAX}" ]; then
                # skip if bigger than 500 MiB
                return 1
            fi
            bsdtar --list --file "${FILE_PATH}"
            ;;
        rar)
            # Avoid password prompt by providing empty password
            unrar lt -p- -- "${FILE_PATH}"
            ;;
        7z)
            # Avoid password prompt by providing empty password
            7z l -p -- "${FILE_PATH}"
            ;;

        pdf)
            # Preview as text conversion
            pdftotext -l 10 -nopgbrk -q -- "${FILE_PATH}" -
            ;;

        h5)
            printf "HDF keys:\n"
            h5ls "${FILE_PATH}"
            ;;

        torrent)
            transmission-show -- "${FILE_PATH}"
            ;;

        # OpenDocument
        odt|ods|odp|sxw)
            # Preview as text conversion
            odt2txt "${FILE_PATH}"
            ;;

        # HTML
        htm|html|xhtml)
            # Preview as text conversion
            w3m -dump "${FILE_PATH}" ||\
            lynx -dump -- "${FILE_PATH}" ||\
            elinks -dump "${FILE_PATH}"
            ;;
        *)
            # Fall through and try the next handler
            return 1
            ;;
    esac
}

handle_mime() {
    # Preview based on the mime type.
    local mimetype="${1}"
    case "${mimetype}" in
        # Text
        text/* | */xml | */json | */csv)
            # Syntax highlight
            # if [ "$(stat --dereference --printf="%s" -- "${FILE_PATH}" )" -gt "${HIGHLIGHT_SIZE_MAX}"]; then
            #     # Skip if file too long
            #     cat "${FILE_PATH}"
            #     return
            # fi
            # if [ "$( tput colors )" -ge 256 ]; then
            #     local highlight_format="xterm256"
            # else
            #     local highlight_format="ansi"
            # fi
            # highlight --replace-tabs="${HIGHLIGHT_TABWIDTH}" --out-format="${highlight_format}" \
            #     --config-file="${HIGHLIGHT_STYLE}" --force -- "${FILE_PATH}"
            highlight --style "$XDG_CONFIG_HOME/highlight/themes/flavours.theme" --out-format "ansi" --force -- "${FILE_PATH}" ||\
            cat "${FILE_PATH}"
            ;;

        # Image
        image/*)
            # Preview as text conversion
            # img2txt --gamma=0.6 -- "${FILE_PATH}" && exit 1
            exiftool "${FILE_PATH}"
            ;;

        # Video and audio
        video/* | audio/*)
            # mediainfo "${FILE_PATH}"
            exiftool "${FILE_PATH}"
            ;;
        *)
            # Fall through and try the next handler
            return 1
            ;;
    esac
}

handle_fallback() {
    echo "----- File Type Classification -----"
    file --dereference --brief -- "${FILE_PATH}"
}


MIMETYPE="$(file --dereference --brief --mime-type -- "${FILE_PATH}")"
# Try handlers and stop when one doesn't fail
handle_extension || handle_mime "${MIMETYPE}" || handle_fallback
