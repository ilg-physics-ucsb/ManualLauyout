import panflute as pf

def prepare(doc):
    doc.latest_video=1


def action(elem, doc):
    if isinstance(elem, pf.Div) and "GVideo" in elem.classes:
        gvideo = elem
        file_id = gvideo.content[0].content[0].text
        video = """
        <figure>
        <iframe width="90vw" height="70vw" src="https://drive.google.com/file/d/{0}/preview"></iframe>
        <figcaption>Video {1}
        </figure>
        """.format(file_id, doc.latest_video)
        gvideo = pf.RawBlock(video)
        doc.latest_video += 1
        return gvideo

def finalize(doc):
    pass


def main(doc=None):
    return pf.run_filter(action,
                         prepare=prepare,
                         finalize=finalize,
                         doc=doc) 

if __name__ == '__main__':
    main()