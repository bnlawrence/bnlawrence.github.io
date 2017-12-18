---
layout: post
title: Cost Models
last_modified: Tuesday 20 May, 2008
tags: badc curation
categories: computing
---
Sam and I had a good chat about [cost models]({% post_url oldblog/2005-07-28-business_models_and_curation %}) today - he's in the process of honing the model we use for charging NERC for programme data management support.

Most folk think the major cost in data management is for storage, and yes, for a PB-scale repository that might be true, but even then it might not, it all depends on the amount of diversity in the data holdings. If you're in it for the long time, then the information management costs trump the data storage costs.

Some folk also think that we should spend a lot of time on retention policies, and actively review **and discard** data when it's no longer relevant. I'm [on record]({% post_url oldblog/2005-11-14-on_moores_law %}) that from the point of view of the data storage cost, the data that we hold is a marginal cost on the cost of storing the data we expect. So I asserted to Sam that it's a waste of time to carry out retention assessment, since the cost of doing so (in person time) outweighs the benefits of removing the data from storage. I then rapidly had to caveat that when we do *information migration* (from, for example, one metadata system to another), there may be a signficant cost in doing so, so it is appropriate to assess datasets for retention at that point. (But again, this is not about storage costs, it's about information migration costs).

Sam called me on that too! He pointed out that not looking at something is the same as throwing it out, it just takes longer. His point was that if the designated community associated with the data is itself changing, then their requirements of the dataset may be changing (perhaps the storage format is obsolete from a consumer point of view even if it is ok from a bit-storage point of view, perhaps the information doesn't include key parameters which define some aspect of the context of the data production etc). In that case, the information value of the data holding is degrading, and at some point the data become worthless.

I nearly argued that the designated communities don't change faster than our information systems, but while it might be true now for us, it's almost certainly not true of colleagues in other data centres with more traditional *big-iron-databases* as both their persistence and information stores ... and I hope it wont remain true of us (our current obsession with MOLES changes needs to change to an obsession with populating a relatively static information type landscape).

However, the main cost of data management remains in the ingestion phase, gathering and storing the contextural information and (where the data is high volume) putting the first copy into our archive. Sam had one other trenchant point to make about this: the gathering information phase cost is roughly proportional to the size of the programme generating the data: if it includes lots of people, then finding out what they are doing, and what the data management issues are will be a signficant cost, nearly independent of the actual amount of data that needs to be stored: human communication takes time and costs money!
