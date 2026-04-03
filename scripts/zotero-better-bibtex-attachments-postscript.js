// Better BibTeX Postscript for Enhanced CSL YAML Export
// Extracts web attachments and adds them to the export

if (Translator.BetterCSL) {
  // Extract and add attachments
  var attachments = extractAttachments(zotero);
  if (attachments.length > 0) {
    csl.attachments = attachments;
  }

  // Extract and add tags
  var tags = extractTags(zotero);
  if (tags.length > 0) {
    csl.tags = tags;
  }
}

/**
 * Extract attachment URLs and web links from Zotero item
 */
function extractAttachments(zotero) {
  var attachments = [];

  // Check zotero.attachments array
  if (zotero.attachments && zotero.attachments.length > 0) {
    for (var i = 0; i < zotero.attachments.length; i++) {
      var att = zotero.attachments[i];

      if (!att) continue;

      var attachment = null;

      // Web links are stored with url property
      if (att.url) {
        // Determine type based on URL or mimeType
        var type = 'webpage';
        if (att.mimeType === 'application/pdf' || att.url.match(/\.pdf$/i)) {
          type = 'pdf';
        }

        attachment = {
          title: att.title || (type === 'pdf' ? 'PDF' : 'Web Link'),
          url: att.url,
          type: type
        };
      }
      // Some attachments might have path properties that are URLs
      else if (att.path && att.path.match(/^https?:\/\//)) {
        attachment = {
          title: att.title || 'Web Link',
          url: att.path,
          type: 'webpage'
        };
      }

      if (attachment) {
        attachments.push(attachment);
      }
    }
  }

  return attachments;
}

/**
 * Extract tags from Zotero item
 */
function extractTags(zotero) {
  var tags = [];

  if (zotero.tags && zotero.tags.length > 0) {
    for (var i = 0; i < zotero.tags.length; i++) {
      var tag = zotero.tags[i];
      if (tag) {
        // Handle different tag formats: could be a string or an object with 'tag' property
        if (typeof tag === 'string') {
          tags.push(tag);
        } else if (tag.tag) {
          tags.push(tag.tag);
        }
      }
    }
  }

  return tags;
}
