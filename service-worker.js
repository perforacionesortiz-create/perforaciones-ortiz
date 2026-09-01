const CACHE_VERSION="perforaciones-ortiz-v27-prueba61";
const APP_ASSETS=[
  "./",
  "./index.html",
  "./manifest.webmanifest",
  "./icono-app-192.png",
  "./icono-app-512.png",
  "./icono-apple-180.png",
  "./icono-inicio-invertido.png",
  "./icono-nuevo-trabajo.png",
  "./icono-bombas.png",
  "./icono-clientes.png",
  "./icono-trabajos.png",
  "./hoja-membretada.jpeg",
  "./planilla-control.jpeg",
  "./ensayo-bombeo-plantilla.xlsx",
  "./jszip.min.js"
];

self.addEventListener("install",event=>{
  event.waitUntil(caches.open(CACHE_VERSION).then(cache=>cache.addAll(APP_ASSETS)).then(()=>self.skipWaiting()));
});

self.addEventListener("activate",event=>{
  event.waitUntil((async()=>{
    const keys=await caches.keys();
    await Promise.all(keys.filter(key=>key.startsWith("perforaciones-ortiz-")&&key!==CACHE_VERSION).map(key=>caches.delete(key)));
    await self.clients.claim();
  })());
});

self.addEventListener("fetch",event=>{
  if(event.request.method!=="GET") return;
  const url=new URL(event.request.url);
  if(url.origin!==self.location.origin){
    event.respondWith(fetch(event.request).catch(()=>caches.match(event.request)));
    return;
  }
  event.respondWith((async()=>{
    try{
      const response=await fetch(event.request,{cache:"no-store"});
      if(response&&response.ok){
        const cache=await caches.open(CACHE_VERSION);
        cache.put(event.request,response.clone());
      }
      return response;
    }catch(error){
      return (await caches.match(event.request)) || (await caches.match("./index.html"));
    }
  })());
});
