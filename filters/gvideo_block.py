import panflute as pf

def prepare(doc):
    doc.latest_video=1


def action(elem, doc):
    if isinstance(elem, pf.Div) and "GVideo" in elem.classes:
        print("Inside")
        gvideo = elem
        file_id = gvideo.content[0].content[0].text
        video = """
        <figure>
        <iframe width="900" height="600" src="https://drive.google.com/file/d/{0}/preview"></iframe>
        <figcaption>Video {1}
        </figure>
        """.format(file_id, doc.latest_video)
        # parent.content[gvideo.index] = 
        # gvideo = pf.convert_text(gvideo, input_format="html")
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